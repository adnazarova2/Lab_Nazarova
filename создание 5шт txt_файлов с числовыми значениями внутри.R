# ��� 1: �������� 5 ��������� ������ � ��������� ����������
for (i in 1:5) {
    data <- sample(1:100, 10)  # ���������� ��������� �����
    write.table(data, file = paste0("n", i, ".txt"), col.names = FALSE, row.names = FALSE)
}

# ��� 2: ���������� ������ ���� � ��������� ��� ���������� � ����������
for (i in 1:5) {
    assign(paste0("m", i), read.table(paste0("n", i, ".txt"), header = FALSE)[, 1])
}

# ��� 3: ���������� 5 ���������� � ��������� � �������� ���
data_frame <- data.frame(m1, m2, m3, m4, m5)
print(data_frame)
