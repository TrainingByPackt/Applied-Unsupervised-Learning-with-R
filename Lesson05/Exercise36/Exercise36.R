solution <- fa(r = big_cor, nfactors = 5, rotate = "oblimin", fm = "pa") 
solution <- fa(r = big_cor, nfactors = 3, rotate = "varimax", fm = "minres")
print(solution)
parallel <- fa.parallel(big5, fm = 'minres', fa = 'fa')
