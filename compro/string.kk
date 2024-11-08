module compro/string

pub fun stoi(s: string) : <exn> int
    s.parse-int.unjust

pub fun length(s: string) : int
    s.list.length

pub fun substr(s: string, l: int, r: int) : string
    var res := ""
    s.list.foreach-indexed(fn(i, x) {
        if l <= i && i < r then
            res := res ++ x.string
    })
    res

pub fun endswith(s: string, e: string) : bool
    if s.length() < e.length() then
        return False
    var res := True
    zip(s.list.reverse, e.list.reverse).foreach(fn(t) {
        if t.fst != t.snd then
            res := False
    })
    res
