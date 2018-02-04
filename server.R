library(shiny)
library(ggplot2)
shinyServer(function(input, output) {

  output$plot1 <- renderPlot({
    NivelPhreatic <- input$NF
    Unitweight <- input$Density
    Depth<-seq(1.5,30, by=1.5)
    set.seed(159)
    SPT<-sample(1:50, length(Depth), replace=T)
    data<-as.data.frame(cbind(Depth, SPT))
    NivelPhreatic<-input$NF
    Unitweight<-input$Density
    UnitweightSum<-Unitweight-10
    data$SPTn<-rep(5,20)
    for (i in 1:nrow(data)){
            if (NivelPhreatic>data$Depth[i]){
                    data$SPTn[i]<- data$SPT[i]*(1/sqrt(Unitweight*Depth[i]/100))
            } else {
                    data$SPTn[i]<- data$SPT[i]*(1/((NivelPhreatic*Unitweight + (UnitweightSum*(data$Depth[i]-NivelPhreatic)))/100))
            }
    }
    g<-ggplot()+geom_hline(yintercept = NivelPhreatic, col="blue")
    if (input$SPTnet){
             g<-g+geom_path(data=data, aes(SPT, Depth ))+geom_point(data=data, aes(SPT, Depth ))
    }
    if (input$SPTNormalized){
            g<-g+geom_path(data=data, aes(SPTn, Depth, col="red"))+geom_point(data=data, aes(SPTn, Depth, col="red"))
    }
    g+scale_y_reverse()+xlim(0,max(data$SPT))+theme(legend.position = "none")

  })
  
})