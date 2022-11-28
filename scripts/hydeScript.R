library(vroom)
library(raster)
library(rgdal)
library(purrr)
library(here)
library(raster)
library(cowplot)
library(svglite)
library(tidyverse)

## Code used to combine the raster files downloaded from HYDE database (https://easy.dans.knaw.nl/ui/datasets/id/easy-dataset:74467/tab/2)

# my_f <- list.files(here("data", "pop_dens"), pattern = "\\.asc$", full.names = T) %>%
#   .[1:19] %>%
#   map(~raster(.))
# 
# DEMcrop2 <- my_f %>% map(~crop(., extent(22-0.5,28+0.5,56,60))) # cropping grids based on sites' coordinates

## We saved an .RDS file to avoid uploading heavy files on GitHub. The data used can be retrieved from the link above
## saveRDS(DEMcrop2, here("rds", "pop_dens.RDS"))

DEMcrop2 <- readRDS(here("rds", "pop_dens.RDS"))

df1 <- DEMcrop2 %>% 
map(~as.data.frame(., xy=TRUE) %>% #transforming raster into df
      drop_na() %>% #excluding NA cells
     mutate(ybp = colnames(.[3])) %>% # creating new column based on years names
  filter(.[[3]]>0)) %>%  # filtering samples with values > 0
  set_names(., nm = map(.x = ., 
                        ~glue::glue("{first(.x$ybp)}"))) %>% # changing element list names
  map(~mutate(.,max_pop = sum(.[[3]])) %>% # summing up population per grid in each sample
      dplyr::select(-3:-4)) %>% #excluding unnecessary columns
  imap_dfr(., ~mutate(.x, ybp = .y, .after = y)) %>% # creating ybp column name
  separate(., ybp, c("pop", "year")) %>% # separating string by "_"
  dplyr::select(-pop) %>% 
  arrange(desc(max_pop))

df2 <- df1 %>% 
  mutate(ybp = str_extract(year, "[0-9]+"),
         bp = str_extract(year, "[aA-zZ]+")) %>% 
  dplyr::select(-year)%>%
  mutate(ybp = as.numeric(ybp)) %>% 
  split(.$bp)
         

         
dfbp<- df2[[1]] %>% 
  mutate(ybp2 = 1950-ybp)

dfad <-df2[[2]] %>% 
  mutate(ybp2 = 1950+ybp)



dfall<-rbind(dfbp,dfad)


hyde_fig<-dfall %>%
  distinct(ybp2, .keep_all = T) %>% 
ggplot(aes(x=ybp2, y=log(max_pop)))+
  geom_point(alpha=.02)+
  geom_smooth(color = "blue", se=F, size=2)+
  scale_x_reverse(n.breaks = 20)+
  theme_cowplot()+
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())+
  ylab("log(Human population counts estimations - in millions)")

dev.off()


#ggsave("hyde.svg",hyde_fig, height=5,width = 12)


