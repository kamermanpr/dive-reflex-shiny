shinyServer(function(input, output) {
    output$BarPlot<-renderGraph({
        cold.h2o<-((input$cold.h2o2-input$cold.h2o1)/input$cold.h2o1)*100
        warm.h2o<-((input$warm.h2o2-input$warm.h2o1)/input$warm.h2o1)*100
        breath<-((input$breath2-input$breath1)/input$breath1)*100
        group<-factor(c("cold.h2o", "warm.h2o", "breath"), levels=c("cold.h2o", "warm.h2o", "breath"), 
                      labels=c("Cold water immersion", "Warm water immersion", "No water immersion"),
                      ordered=T)
        data<-c(cold.h2o, warm.h2o, breath)
        df<-data.frame(Data=data, Group=group)
        df
        gg<-ggplot(data=df, aes(y=Data, x=Group)) +
          geom_bar(stat="identity", fill=c("blue", "red", "gold"), colour="white", line=2) +
          labs(title="Percentage change in heart rate", x="", y="Percentage change (%)") +
          theme(plot.title = element_text(size=20, vjust=2),
                panel.background = element_rect(fill="#89e5e5"),
                axis.title = element_text(size=18, vjust=2), 
                axis.text = element_text(color="#808080", size=16))
        gg
        # use gg2list() to convert from ggplot->plotly
        plot<-gg2list(gg)
        
        # Show zero line on y-axis
        plot$layout$yaxis$zeroline<-TRUE
        plot
        # Send this message up to the browser client, which will get fed through to
        # Plotly's javascript graphing library embedded inside the graph
        return(list(
            list(
                id="BarPlot",
                task="newPlot",
                data=plot$data,
                layout=plot$layout
                )
            ))
    })
})
