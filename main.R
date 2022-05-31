library(tercen)
library(dplyr)

ctx <- tercenCtx()
base <- ctx$op.value('base', as.double, 10)
do.log1p <- ctx$op.value('do.log1p', as.logical, TRUE)

do.log <- function(x, base, do.log1p) {
  if(do.log1p) return(log(x + 1, base = base))
  else return(log(x, base = base))
}

df_out <- ctx %>% 
  select(.y, .ci, .ri) %>% 
  mutate(log = do.log(.y, base = base, do.log1p = do.log1p)) %>%
  ctx$addNamespace()

df_out %>%
  ctx$save()
