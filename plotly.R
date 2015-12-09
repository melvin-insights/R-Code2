##install.packages("plotly")
library(plotly)
library(ggplot2)

set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x = carat, y = price, text = paste("Clarity: ", clarity),
        mode = "markers", color = carat, size = carat)

q<-qplot(Petal.Width, Sepal.Length, data = iris, color = Species)
plot(q)
ggplotly(q)

q<-ggplot(diamonds, aes(x=carat, y=price, color=cut)) + geom_point()
plot(q)
ggplotly(q)

q<-ggplot(diamonds, aes(x=carat, y=price, col=cut)) +  geom_point() +  facet_grid(clarity ~ color)
plot(q)
ggplotly(q)

q<-ggplot(diamonds, aes(carat, price)) + geom_hex()
plot(q)
ggplotly(q)

