f <- function() {
  data_txt <- suppressWarnings(read.table("L3.txt", header = FALSE))
  data_console <- readline(prompt = "������� �����: ")
  d <- data.frame(txt_file = data_txt, console_input = data_console)
  print(d)
}

f()
