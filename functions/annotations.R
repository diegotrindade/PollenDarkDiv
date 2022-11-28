library(ggplot2)



beg_earlyholocene <- 11650
fin_earlyholocene <- 8200

beg_midholocene <- fin_earlyholocene
fin_midholocene <- 4200

beg_lateholocene <- fin_midholocene
fin_lateholocene <- 0


##archaeological

beg_mesolithic <- 11000
fin_mesolithic <- 5900

beg_neolithic <- fin_mesolithic
fin_neolithic <- 4000

beg_bronze <- fin_neolithic
fin_bronze <- 2500

beg_iron <- fin_bronze
fin_iron <- 800


vlines <- c(beg_earlyholocene, beg_midholocene, beg_lateholocene)


theme_div <- list(annotate("rect", fill = "darkblue",
                      xmin = 14500, xmax = 11650,alpha = 0.2,
                      ymin = -Inf, ymax = -1.5),
  annotate("text", x=13200, y=-8, label= "Late \nGlacial", fontface =2, size=5),
  
  
  ### Early Holocene ###
  
  annotate("text", x=9900, y=-8, label= "Early \nHolocene", fontface =2, size=5) ,
  annotate("rect", fill = "green",
           xmin = beg_earlyholocene, xmax = fin_earlyholocene,alpha = 0.1,
           ymin = -Inf, ymax = -1.5),
  
  ### Mid Holocene
  
  annotate("text", x=6200, y=-8, label= "Mid \nHolocene", fontface =2, size=5) ,
  annotate("rect", fill = "red",
           xmin = beg_midholocene, xmax = fin_midholocene,alpha = 0.1,
           ymin = -Inf, ymax = -1.5), 
  
  ### Late Holocene
  
  annotate("text", x=2000, y=-8, label= "Late \nHolocene", fontface =2, size=5) ,
  annotate("rect", fill = "yellow",
           xmin = beg_lateholocene, xmax = fin_lateholocene,alpha = 0.1,
           ymin = -Inf, ymax = -1.5), 
  # Mesolithic #
  
  
  
  annotate("rect", fill = "white",
           xmin = beg_mesolithic, xmax = fin_mesolithic,
           ymin = -22, ymax = -15),
  
  
  annotate("rect", fill = "grey90",
           xmin = beg_neolithic, xmax = fin_neolithic,
           ymin = -22, ymax = -15),
  
  annotate("rect", fill = "grey80",
           xmin = beg_bronze, xmax = fin_bronze,
           ymin = -22, ymax = -15),
  
  annotate("rect", fill = "grey70",
           xmin = beg_iron, xmax = fin_iron,
           ymin = -22, ymax = -15),
  
  annotate("text", x=8300, y=-18, size=4.5, label= "Mesolithic"),
  annotate("text", x=4900, y=-18, size=4.5, label= "Neolithic"),
  annotate("text", x=3250, y=-18, size=4.5, label= "Bronze\nage", lineheight = .7,hjust = .5),
  annotate("text", x=1680, y=-18, size=4.5, label= "Iron\nage", lineheight = .7,hjust = .5),
  
  theme(axis.text.x = element_text(angle = 20, vjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        axis.title.x = element_text(vjust = 0.5, size=18),
        axis.title.y = element_text(vjust = 0.5, size=18),
        legend.text = element_text(size=16)))




theme_completeness <- list(annotate("rect", fill = "darkblue",
         xmin = 14500, xmax = 11650,alpha = 0.2,
         ymin = -Inf, ymax = -1.4),
  annotate("text", x=13100, y=-1.9, label= "Late \nGlacial", fontface =2, size=5),
  
  
  ### Early Holocene ###
  
  annotate("text", x=9900, y=-1.9, label= "Early \nHolocene", fontface =2, size=5) ,
  annotate("rect", fill = "green",
           xmin = beg_earlyholocene, xmax = fin_earlyholocene,alpha = 0.1,
           ymin = -Inf, ymax = -1.4),
  
  ### Mid Holocene
  
  annotate("text", x=6200, y=-1.9, label= "Mid \nHolocene", fontface =2, size=5) ,
  annotate("rect", fill = "red",
           xmin = beg_midholocene, xmax = fin_midholocene,alpha = 0.1,
           ymin = -Inf, ymax = -1.4), 
  
  ### Late Holocene
  
  annotate("text", x=2000, y=-1.9, label= "Late \nHolocene", fontface =2, size=5) ,
  annotate("rect", fill = "yellow",
           xmin = beg_lateholocene, xmax = fin_lateholocene,alpha = 0.1,
           ymin = -Inf, ymax = -1.4), 
  # Mesolithic #
  
  
  
  annotate("rect", fill = "white",
           xmin = beg_mesolithic, xmax = fin_mesolithic,
           ymin = -2.5, ymax = -3.2),
  
  
  annotate("rect", fill = "grey90",
           xmin = beg_neolithic, xmax = fin_neolithic,
           ymin = -2.5, ymax = -3.2),
  
  annotate("rect", fill = "grey80",
           xmin = beg_bronze, xmax = fin_bronze,
           ymin = -2.5, ymax = -3.2),
 
  
  annotate("rect", fill = "grey70",
           xmin = beg_iron, xmax = fin_iron,
           ymin = -2.5, ymax = -3.2),
  
  annotate("text", x=8300, y=-2.8, size=4.5, label= "Mesolithic") ,
  annotate("text", x=4900, y=-2.8, size=4.5, label= "Neolithic") ,
  annotate("text", x=3250, y=-2.8, size=4.5, label= "Bronze\nage", lineheight = .7,hjust = .5) ,
  annotate("text", x=1680, y=-2.8, size=4.5, label= "Iron\nage", lineheight = .7,hjust = .5),
  
  theme(axis.text.x = element_text(angle = 20, vjust = 0.5, size=16),
        axis.text.y = element_text(size=16),
        axis.title.x = element_text(vjust = 0.5, size=18),
        axis.title.y = element_text(vjust = 0.5, size=18),
        legend.text = element_text(size=16)))


theme_traits <- list(annotate("rect", fill = "darkblue",
                                      xmin = 14500, xmax = 11650,alpha = 0.2,
                                      ymin = Inf, ymax = 2.3),
                             
                             
                             
                             ### Early Holocene ###
                     
                             annotate("rect", fill = "green",
                                      xmin = beg_earlyholocene, xmax = fin_earlyholocene,alpha = 0.1,
                                      ymin = Inf, ymax = 2.3),
                             
                             ### Mid Holocene
                    
                             annotate("rect", fill = "red",
                                      xmin = beg_midholocene, xmax = fin_midholocene,alpha = 0.1,
                                      ymin = Inf, ymax = 2.3), 
                             
                             ### Late Holocene
                    
                             annotate("rect", fill = "yellow",
                                      xmin = beg_lateholocene, xmax = fin_lateholocene,alpha = 0.1,
                                      ymin = Inf, ymax = 2.3), 
                     annotate("text", x=13100, y=2.65, label= "Late \nGlacial", fontface =2, size=5),
                     annotate("text", x=9900, y=2.65, label= "Early \nHolocene", fontface =2, size=5) ,
                     annotate("text", x=6200, y=2.65, label= "Mid \nHolocene", fontface =2, size=5) ,
                     annotate("text", x=2000, y=2.65, label= "Late \nHolocene", fontface =2, size=5) ,
                             # Mesolithic #
                             
                             
                             
                             annotate("rect", fill = "white",
                                      xmin = beg_mesolithic, xmax = fin_mesolithic,
                                      ymin = 2.95, ymax = 3.27),
                             
                             
                             
                             annotate("rect", fill = "grey90",
                                      xmin = beg_neolithic, xmax = fin_neolithic,
                                      ymin = 2.95, ymax = 3.27),
                             
                             annotate("rect", fill = "grey80",
                                      xmin = beg_bronze, xmax = fin_bronze,
                                      ymin = 2.95, ymax = 3.27),
                             
                             annotate("rect", fill = "grey70",
                                      xmin = beg_iron, xmax = fin_iron,
                                      ymin = 2.95, ymax = 3.27),
                     
                     annotate("text", x=8300, y=3.1, size=4.5, label= "Mesolithic"),
                     annotate("text", x=4900, y=3.1, size=4.5, label= "Neolithic"),
                     annotate("text", x=3250, y=3.1, size=4.5, label= "Bronze\nage", lineheight = .7,hjust = .5),
                     annotate("text", x=1680, y=3.1, size=4.5, label= "Iron\nage", lineheight = .7,hjust = .5),
                     
                     theme(axis.text.x = element_text(angle = 20, vjust = 0.5, size=16),
                           axis.text.y = element_text(size=16),
                           axis.title.x = element_text(vjust = 0.5, size=18),
                           axis.title.y = element_text(vjust = 0.5, size=18),
                           legend.text = element_text(size=16)))




