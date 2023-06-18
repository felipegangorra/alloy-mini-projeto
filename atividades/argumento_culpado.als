module argumento_culpado

/*  Assumindo esses dois predicados como verdade:
Felipe Bisneto não é culpado.
Romeuette é culpado se Felipe Bisneto for culpado.

Dá pra concluir?
Romeuette não é culpado */

abstract sig Pessoa{}
one sig FelipeB,Romeuette extends Pessoa{}
sig Culpado in Pessoa {} 

fact {FelipeB not in Culpado}
fact {Romeuette in Culpado implies FelipeB in Culpado}


// verificação
assert conclusion {Romeuette not in Culpado}
check conclusion

pred show[]{}
run show