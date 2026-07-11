
#### Packages####
install.packages(c("sf", "readxl", "tmap", "dplyr"))

install.packages("stringr")

library(sf)
library(readxl)
library(tmap)
library(dplyr)





#### Exploaration ####
# Load libraries
library(sf)
library(readxl)
library(tmap)
library(dplyr)

# Step 1: Read shapefile


bd_map <- st_read("D:\\Research\\Saudi\\new idea\\spatial data\\bd_shp\\bd.shp")




# Step 2: Read Excel data
ict_data <- readxl::read_excel("D:/Research/Saudi/new idea/spatial data/ict_combined_block_by_division.xlsx")







# Load necessary libraries
library(sf)
library(readxl)
library(tmap)
library(scales)






#### Digital Connectivity and Anxiety Symptoms ####

# Load libraries
library(sf)
library(readxl)
library(tmap)
library(dplyr)
library(stringr)

# Load shapefile and Excel data
bd_map <- st_read("D:/Research/Saudi/new idea/spatial data/bd_shp/bd.shp")

ict_mental_data <- read_excel(
  "D:/Research/Saudi/new idea/spatial data/ict_mental_combined_block_by_division.xlsx"
)

# Fix division names
ict_mental_data <- ict_mental_data %>%
  mutate(
    hh_division = str_to_title(hh_division),
    hh_division = recode(
      hh_division,
      "Barishal" = "Barisal",
      "Chattogram" = "Chittagong"
    )
  )

# Merge data
bd_map_data <- merge(
  bd_map,
  ict_mental_data,
  by.x = "name",
  by.y = "hh_division"
)

# Create RGB classification
bd_map_data <- bd_map_data %>%
  mutate(
    internet_high = ifelse(
      pct_internet_users >= median(pct_internet_users),
      1, 0
    ),
    
    ownership_high = ifelse(
      pct_ict_owners >= median(pct_ict_owners),
      1, 0
    ),
    
    usage_high = ifelse(
      pct_ict_users >= median(pct_ict_users),
      1, 0
    ),
    
    combined_color = rgb(
      internet_high,
      ownership_high,
      usage_high
    ),
    
    anxiety_label = paste0(round(pct_anxiety,1), "%")
  )

# RGB Legend with Journal Standard
legend_colors <- c(
  rgb(1,0,0),   # Internet
  rgb(0,1,0),   # Ownership
  rgb(0,0,1),   # Usage
  rgb(1,1,0),   # Internet + Ownership
  rgb(0,1,1),   # Ownership + Usage
  rgb(1,0,1),   # Internet + Usage
  rgb(1,1,1),   # All High
  rgb(0,0,0)    # All Low
)

legend_labels <- c(
  "High Internet Only",
  "High Ownership Only",
  "High Usage Only",
  "Internet + Ownership",
  "Ownership + Usage",
  "Internet + Usage",
  "All High (White)",
  "All Low (Black)"
)

# Label colours
bd_map_data$name_color <-
  ifelse(
    bd_map_data$name %in% c("Dhaka","Chittagong"),
    "black",
    "white"
  )

bd_map_data$anxiety_color <- bd_map_data$name_color

bd_map_data$label_halo <- "white"
bd_map_data$anxiety_halo <- "white"

# Shift labels
bd_map_data$xmod_name <-
  ifelse(
    bd_map_data$name=="Chittagong",
    0.5,
    0
  )

bd_map_data$xmod_anxiety <-
  ifelse(
    bd_map_data$name=="Chittagong",
    0.5,
    0
  )

# Publication-quality map with LAT/LONG GRATICULES
# ALL AXIS LABELS BOLD and NO TITLES

tm <- tm_shape(bd_map_data) +
  
  # Nature-themed background with BOLD axis labels
  tm_graticules(
    lines = TRUE,
    labels.size = 0.9,              # Increased size for better readability
    labels.col = "#1B5E20",         # Dark green for labels
    labels.fontface = "bold",       # ALL AXIS LABELS BOLD
    col = "#A5D6A7",               # Light green grid lines
    lwd = 0.5,
    alpha = 0.6
  ) +
  
  tm_polygons(
    col="combined_color",
    border.col="#1B5E20",          # Dark green borders
    lwd=1.2
  ) +
  
  tm_text(
    "name",
    size=0.8,
    col="name_color",
    fontface="bold",
    halo=TRUE,
    halo.col="label_halo",
    halo.size=1.8,
    xmod="xmod_name",
    ymod=0.28
  ) +
  
  tm_text(
    "anxiety_label",
    size=0.95,
    col="anxiety_color",
    fontface="bold",
    halo=TRUE,
    halo.col="anxiety_halo",
    halo.size=1.8,
    xmod="xmod_anxiety",
    ymod=-0.35
  ) +
  
  tm_compass(
    type="rose",                   # More elegant rose compass
    position=c("right","top"),
    size=1.8,
    color.dark = "#1B5E20",
    color.light = "#E8F5E9"
  ) +
  
  tm_scale_bar(
    position=c("left","bottom"),
    text.size=0.8,
    color.dark = "#1B5E20",
    color.light = "#E8F5E9"
  ) +
  
  tm_layout(
    
    # TITLE REMOVED - set to empty
    main.title = "",
    main.title.size = 0,
    
    # Stylish background with subtle gradient effect
    bg.color = "#F1F8E9",           # Light nature green background
    
    # Legend outside on the right
    legend.outside=TRUE,
    legend.outside.position="right",
    
    legend.title.size=1.1,
    legend.title.fontface="bold",
    legend.title.color="#1B5E20",
    
    legend.text.size=0.9,
    legend.text.color="#1B5E20",
    
    # Clear legend box with nature style
    legend.bg.color="#E8F5E9",      # Light green background
    legend.bg.alpha=0.95,
    
    legend.frame=TRUE,
    legend.frame.color="#1B5E20",   # Dark green frame
    legend.frame.lwd=2,
    
    # Double frame for elegance
    frame=TRUE,
    frame.col="#1B5E20",
    frame.lwd=2,
    frame.double.line=TRUE,
    
    inner.margins=c(0.04,0.04,0.04,0.04),
    outer.margins=c(0.02,0.15,0.02,0.02),
    
    # ALL ATTRIBUTE TEXT BOLD
    attr.color="#1B5E20",
    attr.size=0.9,
    attr.fontface="bold"
  ) +
  
  tm_add_legend(
    type="fill",
    title="RGB COLOUR CODING",
    labels=legend_labels,
    col=legend_colors,
    border.col="#1B5E20",
    border.lwd=1.5,
    size=1.3
  ) +
  
  # Add latitude/longitude labels with BOLD text
  tm_credits(
    text = "Latitude (N) / Longitude (E)",
    position = c("left", "top"),
    size = 0.9,
    col = "#1B5E20",
    fontface = "bold"               # BOLD for credit text
  )

# Display map
print(tm)

# Save high quality
tmap_save(
  tm,
  filename="D:/Research/Saudi/new idea/spatial data/lancet_map_nature_latlong.png",
  width=12,
  height=9,
  units="in",
  dpi=600
)








#### Depression - Digital Connectivity and Depression Symptoms ####

# Load libraries
library(sf)
library(readxl)
library(tmap)
library(scales)
library(dplyr)
library(stringr)

# Load shapefile and Excel data
bd_map <- st_read("D:/Research/Saudi/new idea/spatial data/bd_shp/bd.shp")
ict_mental_data <- read_excel("D:/Research/Saudi/new idea/spatial data/ict_mental_combined_block_by_division.xlsx")

# Fix division name mismatches
ict_mental_data <- ict_mental_data %>%
  mutate(hh_division = str_to_title(hh_division),
         hh_division = recode(hh_division,
                              "Barishal" = "Barisal",
                              "Chattogram" = "Chittagong"))

# Merge shapefile and Excel data
bd_map_data <- merge(bd_map, ict_mental_data, by.x = "name", by.y = "hh_division")

# Classify digital exposure into binary categories (high/low via median split)
bd_map_data <- bd_map_data %>%
  mutate(
    internet_high = ifelse(pct_internet_users >= median(pct_internet_users), 1, 0),
    ownership_high = ifelse(pct_ict_owners >= median(pct_ict_owners), 1, 0),
    usage_high = ifelse(pct_ict_users >= median(pct_ict_users), 1, 0),
    combined_color = rgb(internet_high, ownership_high, usage_high),
    depression_label = paste0(round(pct_depression, 1), "%")  # Use depression %
  )

# RGB legend color and label
legend_colors <- c(
  rgb(1, 0, 0),   # Red
  rgb(0, 1, 0),   # Green
  rgb(0, 0, 1),   # Blue
  rgb(1, 1, 0),   # Yellow
  rgb(0, 1, 1),   # Cyan
  rgb(1, 0, 1),   # Magenta
  rgb(1, 1, 1),   # White
  rgb(0, 0, 0)    # Black
)

legend_labels <- c(
  "High Internet Only",
  "High Ownership Only",
  "High Usage Only",
  "Internet + Ownership",
  "Ownership + Usage",
  "Internet + Usage",
  "All High (White)",
  "All No Use (Black)"
)

# Division name and depression label color setup
bd_map_data$name_color <- ifelse(bd_map_data$name %in% c("Dhaka", "Chittagong"), "black", "white")
bd_map_data$depression_color <- bd_map_data$name_color
bd_map_data$label_halo <- "white"
bd_map_data$depression_halo <- "white"

# Position shifts for Chittagong to avoid overlap
bd_map_data$xmod_name <- ifelse(bd_map_data$name == "Chittagong", 0.5, 0)
bd_map_data$xmod_depression <- ifelse(bd_map_data$name == "Chittagong", 0.5, 0)

# Final map with NATURE-MEDICINE STYLE, BOLD AXIS LABELS, NO TITLE
tm <- tm_shape(bd_map_data) +
  
  # Nature-themed background with BOLD axis labels
  tm_graticules(
    lines = TRUE,
    labels.size = 0.9,              # Increased size for better readability
    labels.col = "#1B5E20",         # Dark green for labels
    labels.fontface = "bold",       # ALL AXIS LABELS BOLD
    col = "#A5D6A7",               # Light green grid lines
    lwd = 0.5,
    alpha = 0.6
  ) +
  
  tm_polygons(
    col = "combined_color", 
    border.col = "#1B5E20",          # Dark green borders
    lwd = 1.2
  ) +
  
  tm_text("name", 
          size = 0.8, 
          col = "name_color", 
          fontface = "bold",
          halo = TRUE, 
          halo.col = "label_halo", 
          halo.size = 1.8,
          xmod = "xmod_name", 
          ymod = 0.28) +
  
  tm_text("depression_label", 
          size = 0.95, 
          col = "depression_color", 
          fontface = "bold",
          halo = TRUE, 
          halo.col = "depression_halo", 
          halo.size = 1.8,
          xmod = "xmod_depression", 
          ymod = -0.35) +
  
  tm_compass(
    type = "rose",                   # More elegant rose compass
    position = c("right", "top"),
    size = 1.8,
    color.dark = "#1B5E20",
    color.light = "#E8F5E9"
  ) +
  
  tm_scale_bar(
    position = c("left", "bottom"),
    text.size = 0.8,
    color.dark = "#1B5E20",
    color.light = "#E8F5E9"
  ) +
  
  tm_layout(
    
    # TITLE REMOVED - set to empty
    main.title = "",
    main.title.size = 0,
    
    # Stylish background with subtle gradient effect
    bg.color = "#F1F8E9",           # Light nature green background
    
    # Legend outside on the right
    legend.outside = TRUE,
    legend.outside.position = "right",
    
    legend.title.size = 1.1,
    legend.title.fontface = "bold",
    legend.title.color = "#1B5E20",
    
    legend.text.size = 0.9,
    legend.text.color = "#1B5E20",
    
    # Clear legend box with nature style
    legend.bg.color = "#E8F5E9",      # Light green background
    legend.bg.alpha = 0.95,
    
    legend.frame = TRUE,
    legend.frame.color = "#1B5E20",   # Dark green frame
    legend.frame.lwd = 2,
    
    # Double frame for elegance
    frame = TRUE,
    frame.col = "#1B5E20",
    frame.lwd = 2,
    frame.double.line = TRUE,
    
    inner.margins = c(0.04, 0.04, 0.04, 0.04),
    outer.margins = c(0.02, 0.15, 0.02, 0.02),
    
    # ALL ATTRIBUTE TEXT BOLD
    attr.color = "#1B5E20",
    attr.size = 0.9,
    attr.fontface = "bold"
  ) +
  
  tm_add_legend(
    type = "fill",
    title = "RGB COLOUR CODING",
    labels = legend_labels,
    col = legend_colors,
    border.col = "#1B5E20",
    border.lwd = 1.5,
    size = 1.3
  ) +
  
  # Add latitude/longitude labels with BOLD text
  tm_credits(
    text = "Latitude (N) / Longitude (E)",
    position = c("left", "top"),
    size = 0.9,
    col = "#1B5E20",
    fontface = "bold"               # BOLD for credit text
  )

# Show map
print(tm)

# Save high quality
tmap_save(
  tm,
  filename = "D:/Research/Saudi/new idea/spatial data/lancet_map_depression_nature.png",
  width = 12,
  height = 9,
  units = "in",
  dpi = 600
)










#### Descriptives : Rural-Urban And Mental Health Symptoms ####


# Load required libraries

library(ggplot2)
library(dplyr)
library(scales)
library(gridExtra)
library(grid)


# Create data for Figure (a): Internet Status

internet_data <- data.frame(
  Status = c("No", "Yes", "No", "Yes"),
  Condition = c("Anxiety", "Anxiety", "Depression", "Depression"),
  Percentage = c(22.2, 77.8, 19.2, 80.8)
)


# Create data for Figure (b): ICT Usage

usage_data <- data.frame(
  Status = c("No", "Yes", "No", "Yes"),
  Condition = c("Anxiety", "Anxiety", "Depression", "Depression"),
  Percentage = c(53.5, 46.5, 50.0, 50.0)
)


# Create data for Figure (c): ICT Ownership

ownership_data <- data.frame(
  Status = c("No", "Yes", "No", "Yes"),
  Condition = c("Anxiety", "Anxiety", "Depression", "Depression"),
  Percentage = c(16.5, 83.5, 18.1, 81.9)
)


# Function to create individual plots with NATURE-MEDICINE STYLE

create_mental_health_plot <- function(data, x_label, y_max = 100) {
  
  p <- ggplot(data, aes(x = Status, y = Percentage, fill = Condition)) +
    
    # Bars with nature-inspired colors and borders
    geom_col(width = 0.5,
             color = "#1B5E20",
             linewidth = 0.6,
             position = position_dodge(width = 0.6)) +
    
    # Percentage labels on top of bars - BOLD
    geom_text(aes(label = paste0(Percentage, "%")),
              position = position_dodge(width = 0.6),
              vjust = -0.5,
              size = 4.5,
              fontface = "bold",
              color = "#1B5E20",
              family = "Times New Roman") +
    
    # NATURE-MEDICINE COLOR PALETTE
    scale_fill_manual(values = c(
      "Anxiety" = "#E67E22",      # Orange (anxiety)
      "Depression" = "#2E86C1"    # Blue (depression)
    )) +
    
    # Y-axis with "Prevalence (%)" label
    scale_y_continuous(
      limits = c(0, y_max),
      breaks = seq(0, y_max, 20),
      labels = paste0(seq(0, y_max, 20), "%"),
      expand = expansion(mult = c(0, 0.08))
    ) +
    
    # X-axis with "Yes/No" labels
    scale_x_discrete(
      labels = c("No" = "NO", 
                 "Yes" = "YES")
    ) +
    
    # ALL TITLES REMOVED
    labs(
      title = NULL,
      subtitle = NULL,
      x = NULL,
      y = "Prevalence (%)",
      fill = NULL,
      caption = NULL
    ) +
    
    # Clean theme with nature style
    theme_classic(base_family = "Times New Roman") +
    
    theme(
      # ALL titles removed
      plot.title = element_blank(),
      plot.subtitle = element_blank(),
      plot.caption = element_blank(),
      
      # Y-axis title - BOLD with nature color
      axis.title.y = element_text(
        size = 13,
        face = "bold",
        color = "#1B5E20"
      ),
      
      # Y-axis text - BOLD
      axis.text.y = element_text(
        size = 11,
        face = "bold",
        color = "#1B5E20"
      ),
      
      # X-axis text - BOLD
      axis.text.x = element_text(
        size = 12,
        face = "bold",
        color = "#1B5E20"
      ),
      
      # Axis lines in nature green - BOLD
      axis.line = element_line(
        linewidth = 1.0,
        color = "#1B5E20"
      ),
      
      # Axis ticks in nature green
      axis.ticks = element_line(
        linewidth = 0.8,
        color = "#1B5E20"
      ),
      
      # Axis tick length
      axis.ticks.length = unit(0.15, "cm"),
      
      # Legend at top with nature style
      legend.position = "top",
      legend.text = element_text(
        size = 12,
        face = "bold",
        color = "#1B5E20"
      ),
      
      # Legend title - REMOVED
      legend.title = element_blank(),
      
      # Legend key with nature colors
      legend.key = element_rect(
        fill = "#F1F8E9",
        color = "#1B5E20",
        linewidth = 0.5
      ),
      
      # Legend key size
      legend.key.size = unit(0.7, "cm"),
      
      # Legend spacing
      legend.spacing.x = unit(0.4, "cm"),
      legend.margin = margin(b = 8, t = 5),
      
      # Plot background in light nature green
      plot.background = element_rect(
        fill = "#F1F8E9",
        color = NA
      ),
      
      # Panel background
      panel.background = element_rect(
        fill = "#F1F8E9",
        color = NA
      ),
      
      # Grid lines - subtle and nature-colored
      panel.grid.major.y = element_line(
        color = "#C8E6C9",
        linewidth = 0.4,
        linetype = "dashed"
      ),
      panel.grid.minor.y = element_blank(),
      panel.grid.major.x = element_blank(),
      
      # Add frame around plot (matching map style)
      panel.border = element_rect(
        fill = NA,
        color = "#1B5E20",
        linewidth = 1.5
      ),
      
      # Plot margin
      plot.margin = unit(c(0.3, 0.3, 0.3, 0.3), "cm")
    ) +
    
    # Add x-axis label below bars
    annotate(
      "text",
      x = 0.5,
      y = -7,
      label = x_label,
      hjust = 0,
      size = 4,
      fontface = "bold",
      color = "#1B5E20",
      family = "Times New Roman"
    )
  
  return(p)
}


# Create the three plots with proper labels

p1 <- create_mental_health_plot(internet_data, "Internet Status", 100)
p2 <- create_mental_health_plot(usage_data, "ICT Usage", 100)
p3 <- create_mental_health_plot(ownership_data, "ICT Ownership", 100)


# Add panel labels (a), (b), (c)

p1 <- p1 + annotate("text", x = -Inf, y = Inf, label = "(a)", 
                    hjust = -0.5, vjust = 1.5, size = 5.5, 
                    fontface = "bold", color = "#1B5E20", family = "Times New Roman")

p2 <- p2 + annotate("text", x = -Inf, y = Inf, label = "(b)", 
                    hjust = -0.5, vjust = 1.5, size = 5.5, 
                    fontface = "bold", color = "#1B5E20", family = "Times New Roman")

p3 <- p3 + annotate("text", x = -Inf, y = Inf, label = "(c)", 
                    hjust = -0.5, vjust = 1.5, size = 5.5, 
                    fontface = "bold", color = "#1B5E20", family = "Times New Roman")

# Combine plots in a grid

combined_plot <- grid.arrange(
  p1, p2, p3,
  ncol = 3,
  widths = c(1, 1, 1)
)

# Display combined plot

print(combined_plot)


# Save high quality

ggsave(
  filename = "D:/Research/Saudi/new idea/spatial data/digital_exposure_mental_health.png",
  plot = combined_plot,
  width = 14,
  height = 6.5,
  dpi = 600,
  bg = "#F1F8E9"
)












