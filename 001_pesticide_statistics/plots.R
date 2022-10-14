# Generate 2 bar plots with ggplot2 from the simple data from a csv file 

# Libraries
library(ggplot2)

# Create data frame
data <- data.frame(read.delim("/data/data_1.csv"))

# Sort data for plots
data$A = with(data, reorder(A, B))

# Plot 1A
ggplot(data, aes(x=A, y=B, fill=A)) +
  geom_bar(stat="identity", alpha=.75, width=.5) +
  scale_y_continuous(
    breaks = seq(0, 4500, by = 500),
  ) +
  theme_minimal() +
  labs(
    title = "İl Düzeyinde Bitki Koruma Ürünlerinin Kullanım (Zirai Mücadele Uygulamalarında) Miktarları, 2021",
    subtitle = "En fazla pestisit kullanılan ilk on il ve kullanım miktarları",
    x = "",
    y = "Kullanım Miktarı (Ton)",
    caption = "Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
    ) +
  scale_fill_hue(h = c(50, 10)) +
  theme(
    text = element_text(size=14),
    axis.title.x = element_text(colour = "grey30", margin = margin(t = 10, unit = "pt")),
    panel.grid.major.y = element_blank(),
    legend.position="none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
    ) +
  coord_flip()

# Plot 1B
ggplot(data, aes(x=A, y=C, fill=A)) +
  geom_bar(stat="identity", alpha=.75, width=.5) +
  scale_y_continuous(
    breaks = seq(0, 15, by = 2),
  ) +
  theme_minimal() +
  labs(
    title = "İl Düzeyinde Bitki Koruma Ürünlerinin Kullanım (Zirai Mücadele Uygulamalarında) Miktarları, 2021",
    subtitle = "En fazla pestisit kullanılan ilk on il ve toplam kullanılan miktar içindeki payları",
    x = "",
    y = "Toplamdaki Payı (%)",
    caption = "Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
  ) +
  scale_fill_hue(h = c(200, 240)) +
  theme(
    text = element_text(size=14),
    axis.title.x = element_text(colour = "grey30", margin = margin(t = 10, unit = "pt")),
    panel.grid.major.y = element_blank(),
    legend.position="none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
  ) +
  coord_flip()
