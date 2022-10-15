# Generate bar plots with ggplot2 from the simple data from csv files

# Libraries
library(ggplot2)
library(dplyr)

# Create data frame from data_1.csv
data_1 <- data.frame(read.delim("/data/data_1.csv"))

# Sort data for plots
data_1$A <- with(data_1, reorder(A, B))

# Plot 1A
ggplot(data_1, aes(x = A, y = B, fill = A)) +
  geom_bar(stat = "identity", alpha = .75, width = .5) +
  scale_y_continuous(
    breaks = seq(0, 4500, by = 500),
  ) +
  theme_minimal() +
  labs(
    title = "İl Düzeyinde Bitki Koruma Ürünlerinin Kullanım Miktarları (Zirai Mücadele Uygulamalarında), 2021",
    subtitle = "En fazla pestisit kullanılan ilk on il ve kullanım miktarları",
    x = "",
    y = "Kullanım Miktarı (Ton)",
    caption = "Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
    ) +
  scale_fill_hue(h = c(50, 10)) +
  theme(
    text = element_text(size = 14),
    axis.title.x = element_text(colour = "grey30",
                                margin = margin(t = 10, unit = "pt")),
    panel.grid.major.y = element_blank(),
    legend.position = "none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
    ) +
  coord_flip()

# Plot 1B
ggplot(data_1, aes(x = A, y = C, fill = A)) +
  geom_bar(stat = "identity", alpha = .75, width = .5) +
  scale_y_continuous(
    breaks = seq(0, 15, by = 2),
  ) +
  theme_minimal() +
  labs(
    title = "İl Düzeyinde Bitki Koruma Ürünlerinin Kullanım Miktarları (Zirai Mücadele Uygulamalarında), 2021",
    subtitle = "En fazla pestisit kullanılan ilk on il ve toplam kullanılan miktar içindeki payları",
    x = "",
    y = "Toplamdaki Payı (%)",
    caption = "Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
  ) +
  scale_fill_hue(h = c(200, 240)) +
  theme(
    text = element_text(size = 14),
    axis.title.x = element_text(colour = "grey30",
                                margin = margin(t = 10, unit = "pt")),
    panel.grid.major.y = element_blank(),
    legend.position = "none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
  ) +
  coord_flip()

# Create data frame from data_2.csv
data_2 <- data.frame(read.delim("/data/data_2.csv"))

# Sort data for plots
data_2$A <- with(data_2, reorder(A, B))

# Plot 2A
ggplot(data_2, aes(x = A, y = B, fill = A)) +
  geom_bar(stat = "identity", alpha = .75, width = .5) +
  scale_y_continuous(
    breaks = seq(0, 20000, by = 3000),
  ) +
  theme_minimal() +
  labs(
    title = "Bitki Koruma Ürünlerinin Kullanım Miktarları (Gruplara Ayrılmış Olarak), 2021",
    subtitle = "Toplam pestisit kullanım miktarının gruplara göre dağılımı",
    x = "",
    y = "Kullanım Miktarı (Ton)",
    caption = "*Diğerleri: Bitki Aktivatörü+Bitki Gelişim Düzenleyici+Böcek Cezbedici+Fumigant+Nematisit
    Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
  ) +
  theme(
    text = element_text(size = 14),
    axis.title.x = element_text(colour = "grey30",
                                margin = margin(t = 10, b = 10, unit = "pt")),
    panel.grid.major.y = element_blank(),
    legend.position = "none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
  ) +
  coord_flip()

# Plot 2B
ggplot(data_2, aes(x = A, y = C, fill = A)) +
  geom_bar(stat = "identity", alpha = .75, width = .5) +
  scale_y_continuous(
    breaks = seq(0, 40, by = 4),
  ) +
  theme_minimal() +
  labs(
    title = "Bitki Koruma Ürünlerinin Kullanım Miktarları (Gruplara Ayrılmış Olarak), 2021",
    subtitle = "Toplam pestisit kullanım miktarının gruplara göre dağılım yüzdeleri",
    x = "",
    y = "Toplamdaki Payı (%)",
    caption = "*Diğerleri: Bitki Aktivatörü+Bitki Gelişim Düzenleyici+Böcek Cezbedici+Fumigant+Nematisit
    Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
  ) +
  theme(
    text = element_text(size = 14),
    axis.title.x = element_text(colour = "grey30",
                                margin = margin(t = 10, b = 10, unit = "pt")),
    panel.grid.major.y = element_blank(),
    legend.position = "none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8)
  ) +
  coord_flip()

# Create data frame from data_3.csv
data_3 <- data.frame(read.delim("/data/data_3.csv"))

# Rename headers for plots
colnames(data_3) <- c(
  "Yıllar",
  "Toplam",
  "İnsektisit",
  "Fungisit",
  "Herbisit",
  "Akarisit",
  "Rodentisit+Mollussisit",
  "Diğerleri*"
)

# Subset and gather data for Plot 3A
subset_data_3 <- subset(data_3, select = -c(Toplam))
gather_data_3 <- subset_data_3 %>%
  gather(key = `Türler`, value = Value, -1)

# Plot 3A
gather_data_3 %>%
  ggplot(aes(x = Yıllar, y = Value, group = `Türler`, color = `Türler`)) +
  geom_line(size = 1.5) +
  geom_point(size = 2.5) +
  scale_x_continuous(
    breaks = seq(2006, 2021, by = 1),
    minor_breaks = NULL
  ) +
  scale_y_continuous(
    breaks = seq(0, 25000, by = 5000)
  ) +
  theme_minimal() +
  labs(
    title = "Yıllar İtibarıyla Bitki Koruma Ürünlerinin Kullanım Miktarları (Gruplara Ayrılmış Olarak), 2006-2021",
    subtitle = "Toplam pestisit kullanım miktarının gruplara göre yıllık dağılımı",
    x = "",
    y = "Kullanım Miktarı (Ton)",
    caption = "*Diğerleri: Bitki Aktivatörü+Bitki Gelişim Düzenleyici+Böcek Cezbedici+Fumigant+Nematisit
      Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
  ) +
  scale_colour_brewer(palette = "Dark2") +
  theme(
    text = element_text(size = 14),
    axis.title.y = element_text(colour = "grey30",
                                size = 12,
                                margin = margin(r = 10, l = 10, unit = "pt")),
    legend.position = "bottom",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8),
  )

# Subset and gather data for Plot 3B
subset_total <- subset(data_3, select = c(Yıllar, Toplam))
gather_total <- subset_total %>%
  gather(key = Key, value = Value, -1)

# Plot 3B
gather_total %>%
  ggplot(aes(x = Yıllar, y = Value, group = Key)) +
  geom_line(size = 1.5, color = "#256D85") +
  geom_point(size = 2.5, color = "#06283D") +
  scale_x_continuous(
    breaks = seq(2006, 2021, by = 1),
    minor_breaks = NULL
  ) +
  scale_y_continuous(
    breaks = seq(36000, 61000, by = 2000)
  ) +
  theme_minimal() +
  labs(
    title = "Yıllar İtibarıyla Bitki Koruma Ürünlerinin Kullanım Miktarları, 2006-2021",
    subtitle = "Toplam pestisit kullanım miktarının yıllık dağılımı",
    x = "",
    y = "Kullanım Miktarı (Ton)",
    caption = "Kaynak: T.C. Tarım Ve Orman Bakanlığı Gıda Ve Kontrol Genel Müdürlüğü"
  ) +
  theme(
    text = element_text(size = 14),
    axis.title.y = element_text(colour = "grey30",
                                size = 12,
                                margin = margin(r = 10, l = 10, unit = "pt")),
    legend.position = "none",
    plot.title = element_text(size = 14),
    plot.subtitle = element_text(size = 10),
    plot.caption = element_text(size = 8),
  )
