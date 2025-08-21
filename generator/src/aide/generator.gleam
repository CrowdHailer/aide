import aide/tool
import glance
import glance_printer
import gleam/dict
import gleam/list
import gleam/option.{None, Some}
import oas/generator
import oas/generator/ast
import oas/generator/schema
import oas/json_schema

// [decode.map(flip_input_decoder,Flip(_, flip_output_encode))]

fn to_schema(fields: tool.ObjectSchema) -> json_schema.Schema {
  json_schema.object(fields)
}

pub fn generate(tools) {
  let #(tools, specs) =
    list.map(tools, fn(tool) {
      let tool.Spec(name:, input:, output:) = tool
      #(name, [
        #(name <> "_input", input |> to_schema),
        #(name <> "_output", output |> to_schema),
      ])
    })
    |> list.unzip
  let assert Ok(#(custom, _alias, fns)) =
    schema.generate(specs |> list.flatten |> dict.from_list)
    |> generator.run_single_location("#")
  let imports =
    [
      glance.Import("gleam/dynamic/decode", None, [], []),
      glance.Import("gleam/dict", None, [], []),
      glance.Import("gleam/json", None, [], []),
      glance.Import(
        "gleam/option",
        None,
        [glance.UnqualifiedImport("Option", None)],
        [glance.UnqualifiedImport("None", None)],
      ),
      glance.Import("oas/generator/utils", None, [], []),
    ]
    |> list.reverse

  glance.Module(
    defs(imports),
    defs(custom |> list.append([collective_type(tools)])),
    [],
    [],
    defs(fns),
  )
  |> glance_printer.print
}

fn defs(xs) {
  list.map(xs, glance.Definition([], _))
}

fn collective_type(tools) {
  glance.CustomType(
    "Call",
    glance.Public,
    False,
    [],
    list.map(tools, fn(tool) {
      glance.Variant(ast.name_for_gleam_type(tool), [
        glance.LabelledVariantField(
          glance.NamedType(ast.name_for_gleam_type(tool <> "_input"), None, []),
          "input",
        ),
        glance.LabelledVariantField(
          glance.FunctionType(
            [
              glance.NamedType(
                ast.name_for_gleam_type(tool <> "_output"),
                None,
                [],
              ),
            ],
            glance.NamedType("Dict", Some("dict"), [
              glance.NamedType("String", None, []),
              glance.NamedType("Any", Some("utils"), []),
            ]),
          ),
          "cast",
        ),
      ])
    }),
  )
}
