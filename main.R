library(tercen)
library(dplyr)

(ctx = tercenCtx())  %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  summarise(mean = log(mean(.y), base=as.double(ctx$op.value('base')))) %>%
  ctx$addNamespace() %>%
  ctx$save()
 