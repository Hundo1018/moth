from balanced_ternary import Trit, Tryte

alias T = -1
alias N = T
alias Z = 0
alias P = 1
alias n = Trit(N)
alias z = Trit(Z)
alias p = Trit(P)


fn print_columns[
    Op: fn (Trit[False], Trit[False]) -> Trit[False], sym: String
]():
    var nzp = [n, z, p]
    print("A", "B", "O", "X")
    for a in nzp:
        for b in nzp:
            print(a, b, sym, Op(a, b))


fn print_matrix[
    Op: fn (Trit[False], Trit[False]) -> Trit[False], sym: String
]():
    var nzp = [n, z, p]

    # print(sym, T, Z, P)
    # for a in


fn AND(a: Trit[False], b: Trit[False]) -> Trit[False]:
    return a & b


fn main() raises:
    print_columns[AND, "&"]()
