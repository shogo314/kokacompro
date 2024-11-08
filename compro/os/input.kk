module compro/os/input

extern import
  c file "input-inline.c"


// readline 1023< ver.
pub fun input() : <console,exn> string
  match readline-err() 
    Error(exn)  -> Error(exn.prepend("unable to read from stdin")).untry
    Ok(line)    -> line


fun prepend( exn : exception, pre : string ) : exception
  Exception(pre ++ ": " ++ exn.message, exn.info)


extern readline-err() : console error<string>
  c "kk_compro_os_input_error"
