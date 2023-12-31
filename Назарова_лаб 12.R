library(igraph)
library(statnet) 
install.packages("igraph")
install.packages("statnet")


create_graph <- function(num_companies, num_transactions) {
  adjacency_matrix <- matrix(sample(c(0, 1), num_companies^2, replace = TRUE), ncol = num_companies)
  
  # ��������� ������������ �������� ������� � 0, ����� ����������� �� ���������� ������� ����� ����
  diag(adjacency_matrix) <- 0
  
  graph <- graph_from_adjacency_matrix(adjacency_matrix, mode = "directed")
  
  # �������� ��������� ����� ����� �������������
  edges <- sample(as_data_frame(graph), num_transactions, replace = TRUE)
  
  # ����������� ����� � edgelist
  edgelist <- as_edgelist(edges)
  
  return(edgelist)
}

create_graph_visualization <- function(edgelist) {
  graph <- graph_from_edgelist(edgelist, directed = TRUE)
  
  return(graph)
}


generate_random_graph_data <- function(num_nodes, num_edges) {
  nodes <- 1:num_nodes
  from_nodes <- sample(nodes, num_edges, replace = TRUE)
  to_nodes <- sample(nodes, num_edges, replace = TRUE)
  edgelist <- data.frame(from = from_nodes, to = to_nodes)
  return(edgelist)
}
# ����� ������� ��� �������� edgelist � 10 ������ � 20 ������
random_data <- generate_random_graph_data(10, 20)
#�������� ���� �� ������ ������ �� ���� 1, ��������� ���������� Statnet ��� igraph. � ������ �������, �� ����� ������������ ���������� igraph. ���������, ��� �� ���������� ����� igraph � ������� install.packages("igraph"):

library(igraph)
create_graph <- function(edgelist) {
  graph <- graph_from_data_frame(edgelist, directed = TRUE)
  return(graph)
}
# ����� ������� ��� �������� �����
payment_graph <- create_graph(random_data)
#�������������� ���� ��� ������ ������� gplot, ���������� ��������� ��������� ������� �����, ���������� ��� � �������� �������. ��� ������ ����:

plot_payment_graph <- function(graph) {
  layouts <- list(
    layout_with_fr,     # ������������� �����������
    layout_nicely,      # ������� �� ���������
    layout_randomly     # ��������� �������
  )
  # ���������� ������ ������� � �����
  colors <- c("red", "blue", "yellow")
  par(mfrow = c(1, 3))
  for (i in 1:3) {
    plot(graph, layout = layouts[[i]], vertex.color = colors[i], 
         vertex.label = NA, main = paste("�������", i))
  }
  legend("topright", legend = c("���� 1", "���� 2", "���� 3"),
         col = colors, pch = 3)
}

# ������� ��� ������������ �����
plot_payment_graph(payment_graph)
#��������� ������� ��������� ��� edgelist � ����, ��������� ������� write. ����� ���������� ��������� ��������� � ���� �����������. ��� ������ ����:

write.csv(random_data, "edgelist.csv", row.names = FALSE)

# ���������� ���������
png("payment_graph.png", width = 1000, height = 1000, res = 100)
plot_payment_graph(payment_graph)
dev.off()