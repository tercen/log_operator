library(tercen)
library(dplyr)

(ctx = tercenCtx()) %>% 
  select(.y) %>% 
  transmute(log = log(.y, base=as.double(ctx$op.value('base')))) %>%
  ctx$addNamespace() %>%
  ctx$save()
  