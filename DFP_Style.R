library(ggplot2)
library(showtext)
font_add("futura" ,regular="FuturaBT-Heavy.ttf")
font_add("mstthin",regular="Montserrat-Thin.ttf")
font_add("mstreg" ,regular="Montserrat-Regular.ttf")
showtext_auto()
### Functions
theme_dfp <- function(){
  theme_classic() + theme(plot.title=element_text(family="futura",size=40, hjust=.5),
        text=element_text(family="mstreg"), 
        panel.grid=element_line(size=0), 
        panel.border=element_rect(size=0, fill=NA),
        axis.line=element_line(color="#525353",size=0.1),
        axis.ticks.x=element_line(color="#525353",size=0.1),
        axis.ticks.y=element_line(color="#525353",size=0.1),
        axis.text.x = element_text(family="mstthin", color="black"),
        axis.text.y = element_text(family="mstthin", color="black"))
}

ggtitle_dfp <- function(x){
  ggtitle(toupper(x)) 
    
}
pal_dfp <- scales::manual_pal(c("#124073","#0A2645","#A8BF14","#B71D1A","#BF7800","#b3b3b3"))
scale_color_dfp <- function(...) { discrete_scale("colour", "dfp", pal_dfp, ...) }
scale_fill_dfp <- function(...) { discrete_scale("fill", "dfp", pal_dfp, ...) }


#### Example
data("swiss")
swiss <- reshape(swiss, varying=c("Fertility", "Agriculture", "Examination", "Education", 
                                      "Catholic", "Infant.Mortality"), 
                     times=c("Fertility", "Agriculture", "Examination", "Education", 
                             "Catholic", "Infant.Mortality"),
                     direction = "long", v.names="Stats")

P = ggplot(swiss) +geom_point(aes(x=id, y=Stats, col=time),position=position_dodge(width=.5)) +
  ylab("Proportion") + xlab("") + coord_flip() +
  scale_color_dfp(name="Type") + ggtitle_dfp("Switzerland") + theme_dfp() + theme(legend.spacing.x = unit(0.03, 'in'),legend.spacing.y = unit(0.03, 'in'))

ggsave("ex_theme.png",plot=P, height=3, width=3, units="in")



