nodes <- data.frame(cbind(V(g), as.character(V(g))))

nodes <- data.frame(cbind(V(g),V(g)$name))
edges <- t(Vectorize(get.edge, vectorize.args='id')(g, 1:ecount(g)))

library(rgexf)

output<-write.gexf(nodes, edges, edgesWeight=E(g)$weight)
print(output, "Test.gexf", replace=T)