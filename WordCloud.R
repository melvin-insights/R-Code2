library(tm)
library(SnowballC)
library(wordcloud)

messages <- read.csv('C:/Users/melvin/Desktop/Messages.csv', stringsAsFactors = FALSE)

myCorpus <- Corpus(VectorSource(messages[,c("body")]))

inspect(myCorpus )

myCorpus <- tm_map(myCorpus, PlainTextDocument)
myCorpus <- tm_map(myCorpus, removePunctuation)
myCorpus <- tm_map(myCorpus, removeWords, c('also', 'just' ,'the', stopwords('english')))
myCorpus <- tm_map(myCorpus, stemDocument)

dtm <- TermDocumentMatrix(myCorpus)
m <- as.matrix(dtm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d, 10)

View(d)

findFreqTerms(dtm, lowfreq = 170)
findAssocs(dtm, terms = "client", corlimit = 0.2)

wordcloud(myCorpus,  max.words=45, random.order = TRUE,  colors=brewer.pal(8, "Dark2"))

barplot(d[1:10,]$freq, las = 2, names.arg = d[1:10,]$word,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
