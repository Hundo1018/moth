from balanced_ternary import Trit, Tryte

alias T = Int(-1)
alias N = Int(T)
alias Z = Int(0)
alias P: Int = Int(1)
alias n = Trit(N)
alias z = Trit(Z)
alias p = Trit(P)
alias NNAnd = N & P


fn print_columns[Op: fn (Trit, Trit) -> Trit, sym: String]():
    var nzp = [n, z, p]
    print("A", "B", "O", "X")
    for a in nzp:
        for b in nzp:
            print(a, b, sym, Op(a, b))


fn print_matrix[Op: fn (Trit, Trit) -> Trit, sym: String]():
    var nzp = [n, z, p]
    print(sym, n, z, p)
    for col in nzp:
        print(col, end=" ")
        for row in nzp:
            print(Op(row, col), end=" ")
        print()


fn AND(a: Trit, b: Trit) -> Trit:
    return a & b


fn OR(a: Trit, b: Trit) -> Trit:
    return a | b


fn XOR(a: Trit, b: Trit) -> Trit:
    return a ^ b


fn main() raises:
    # print_columns[AND, "&"]()
    print_matrix[AND, "&"]()
    print()
    print_matrix[OR, "|"]()
    print()
    print_matrix[XOR, "^"]()
