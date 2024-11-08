module compro/list/int

pub fun index(l: list<int>, x: int) : int
    var ret := ~ 1
    l.foreach-indexed (fn(i, t) {
        if t == x && ret == ~ 1 then
            ret := i
    })
    ret

pub fun sort(l: list<int>) : <div> list<int>
    if l.length() <= 1 then return l
    val x : int = l.head(0)
    l.filter(fn(i) {i < x}).sort ++ l.filter(fn(i) {i == x}) ++ l.filter(fn(i) {i > x}).sort

pub fun reverse-sort(l: list<int>) : <div> list<int>
    if l.length() <= 1 then return l
    val x : int = l.head(0)
    l.filter(fn(i) {i > x}).reverse-sort ++ l.filter(fn(i) {i == x}) ++ l.filter(fn(i) {i < x}).reverse-sort

pub fun max(l: list<int>) : <exn> int
    var res := l.head.unjust
    l.tail.foreach(fn(x) {
        if res < x then
            res := x
    })
    res
