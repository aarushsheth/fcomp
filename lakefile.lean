import Lake
open Lake DSL

package «fcomp» where
  -- add package configuration options here

lean_lib «Fcomp» where
  -- add library configuration options here

@[default_target]
lean_exe «fcomp» where
  root := `Main
