# ������� �1 - ������� ����� �������� �������� � ����������� (�����, ������, ������), � ������� ���� ����� ������ (�����������) � �����������.

# ����������� ������ "�������� ��������"
Animal <- setRefClass("Animal",
                      fields = list(name = "character"),
                      methods = list(
                        initialize = function(name) {
                          self$name <- name
                        },
                        speak = function() {
                          stop("����� speak() ������ ���� ������������� � ���������")
                        }
                      )
)

# ����������� ��������� "�����"
Cat <- setRefClass("Cat",
                   contains = "Animal",
                   methods = list(
                     speak = function() {
                       print(paste(self$name, "�������: ���!"))
                     }
                   )
)

# ����������� ��������� "������"
Dog <- setRefClass("Dog",
                   contains = "Animal",
                   methods = list(
                     speak = function() {
                       print(paste(self$name, "�������: ���! ���!"))
                     }
                   )
)

# ����������� ��������� "������"
Cow <- setRefClass("Cow",
                   contains = "Animal",
                   methods = list(
                     speak = function() {
                       print(paste(self$name, "�������: ����!"))
                     }
                   )
)
# ������������� ������� � �������
cat <- Cat$new("�����")
cat$speak() # ������� "����� �������: ���!"

dog <- Dog$new("�����")
dog$speak() # ������� "����� �������: ���! ���!"

cow <- Cow$new("�������")
cow$speak() # ������� "������� �������: ����!"
