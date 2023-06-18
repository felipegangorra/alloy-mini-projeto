module sistemaArquivos

abstract sig Objeto{}

sig Pasta extends Objeto{
	conteudo: set Objeto
}

one sig Raiz extends Pasta{}

sig Arquivo extends Objeto{}

fact{
--	all p:Pasta | #(p.conteudo) <= 5	
	
	all p:Pasta | Raiz not in p.conteudo
	
-- para todo objeto (pasta) não vou encontrar novamente no caminho
	all p:Pasta | p not in p.^conteudo

--	all o:Objeto-Raiz | one o.~conteudo
	all o:Objeto-Raiz | one conteudo.o

}

run {} for 6