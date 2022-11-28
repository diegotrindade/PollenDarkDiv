library(here)
library(stringr)
library(vroom)
library(svglite)

#loading and cleaning data

my_t1 <- vroom(here("data", "paleoview", "temp_all", "temp.csv")) %>% 
  mutate(ybp = str_extract(Year, "[0-9]+"),
         bp = str_extract(Year, "[aA-zZ]+")) %>%
  rename(mean = `Area Mean`) %>% 
  filter(!bp=="AD")%>%
  mutate(ybp = as.numeric(ybp),
         ref = 16.7,
         pred_ind =  mean-ref) %>% 
  select(-Year) 
  
  

ref <- my_t1 %>% filter(ybp >= 250 & ybp <= 550 ) %>% mutate(mean_temp = mean(mean))


#figure
library(cowplot)

paleo_fig<-my_t1  %>% 
  ggplot(aes(x=ybp, y=mean)) + geom_point(alpha=.05) + 
  geom_smooth(#method = "loess", span = 0.05,
    method = "gam",
    formula = y ~  s(x, bs = "cp", k=45),
    colour="red",
    fill = "red")+
    scale_x_reverse(n.breaks = 20)+
  theme_cowplot()+
  theme(axis.title.x = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank())+
  ylab("July mean temperature")
  
#  ggtitle("Using the following gam: formula = y ~  s(x, bs = cp, k=45))")

paleo_fig


#ggsave(here("clim.svg"),paleo_fig, height=5,width = 12)
