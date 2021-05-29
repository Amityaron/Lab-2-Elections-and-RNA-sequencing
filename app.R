;#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("K-means Algorithm on RNA Seq Data "),
    #
    # Sidebar with a slider input for number of Cluster 
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider1",
                        "Number of Cluster:",
                        min = 1,
                        max = 10,
                        value = 3)
        ),
        
        sidebarLayout(
            sidebarPanel(
                sliderInput("slider2",
                            "Max of Iteration:",
                            min = 1,
                            max = 100,
                            value = 3)
            ),
          
            
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    #K-mean algoritem
    med_dat <- read.delim("gtex.txt",skip = 2,row.names=c(1), header = TRUE)
    gen_names <- c(med_dat[ ,1]) 
    med_dat <- as.matrix(subset(med_dat, select = -Description))
    med_dat<- med_dat[rowSums(med_dat[])>0,]
    med_dat<- t(med_dat) 
    med_dat.pca <-prcomp(med_dat, center = TRUE, scale. = T)
    pca_data <- med_dat.pca[["x"]]
    pca_data  <-  as.data.frame(pca_data)[c(1,2)]  
    
    #########
    k_means <- function(df, k, max_iter){
        
        cluster <- k #k
        #first centroid = first k rows
        centroid <- df[1:cluster,]
        
        #dist matrix
        d <- matrix(0, nrow = nrow(df), ncol = cluster)
        
        #creating 0 vector for containing cluster number
        c <- c(0, rep(nrow(df)))
        iter <- 0  #number of iterations
        #creating 0 matrix for temporary variable
        temp_centroid <- matrix(0, nrow = nrow(centroid), ncol = ncol(df))
        status = 1
        max_iter = max_iter
        
        while (max_iter !=0 & status != 0) {
            iter <- iter + 1 #counting iterations
            #calculate distance each data to each centroid
            for(j in 1:cluster) {
                for(i in 1:nrow(df)){
                    d[i,j] <- sqrt(sum((df[i,1:ncol(df)] - centroid[j,1:ncol(centroid)])^2))
                }
            }
            
            #assign cluster number on each data
            c <- apply(d, 1, which.min) 
            
            ####new mean
            compare <- as.data.frame(df) 
            compare$cluster <- c
            
            temp_centroid <- aggregate(compare,by = list(compare$cluster),FUN = mean)
            temp_centroid <- subset(temp_centroid, select = c(-Group.1, -cluster))
            
            #update the current centroid
            if(all(temp_centroid == centroid)){
                status = 0 }
            else{
                status = 1
                centroid <- temp_centroid
            }
            
            max_iter <- max_iter - 1
        }
        
        data_clustering <- as.data.frame(compare)
        return(data_clustering)  
    }  
     
   
    
    
    
    output$distPlot <- renderPlot({
        ###plot the k-mean ! 
        
        # generate bins based on input$bins from ui.R
        
       

        # draw the histogram with the specified number of bins
        library("ggplot2")
        k=input$slider1
        max_iter=input$slider2
        
        kmean_data<- k_means(df = pca_data,k = input$slider1,max_iter = input$slider2)
        
        
        g1 <- ggplot(kmean_data, aes(PC1, PC2))+
            geom_point(aes(colour = factor(cluster)))+
            labs(title = "K_Means Clustering",subtitle = "Clustering of Tissues based on the
        two components of a PCA breakdown")+
            theme(plot.title = element_text(size = rel(1), hjust = 0.5, face = "bold"),
                  plot.subtitle =element_text(size = rel(0.8), hjust = 0.5))
        g1
        #plot(3,4)
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)

