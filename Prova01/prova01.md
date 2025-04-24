# Equipe 
- Anderson Alves dos Santos.
- Juliana Bastos Rittel.

# Tutorial Técnico - Componentes de Layout
Este documento descreve os principais componentes de layout utilizados nos protótipos desenvolvidos:

# 1. Scaffold
Descrição: Estrutura base da interface, fornece um layout visual padrão com barra superior, corpo e outros elementos opcionais.

Aplicações: Presente em todos os protótipos como contêiner principal da interface.

Como usar:
Scaffold(
  appBar: AppBar(title: Text('Título')),
  body: Center(child: Text('Conteúdo')),
)
# 2. AppBar
Descrição: Barra superior com título, ícones de ação e controle de navegação.

Aplicações: Utilizado para dar identidade visual ao app e facilitar a navegação.

Como usar:
AppBar(
  title: Text('Título do App'),
)
# 3. Column
Descrição: Organiza widgets na vertical.

Aplicações: Utilizado para empilhar elementos como imagens, textos e botões.

Como usar:
Column(
  children: [
    Text('Exemplo'),
    Icon(Icons.star),
  ],
)
# 4. Row
Descrição: Organiza widgets horizontalmente.

Aplicações: Utilizado para alinhar o nome do prato e o valor, e para exibir ícones sociais lado a lado.

Como usar:
Row(
  children: [
    Icon(Icons.star),
    Text('5.0'),
  ],
)
# 5. Text
Descrição: Exibe uma string com estilo personalizável.

Aplicações: Presente em todos os protótipos para exibir títulos, descrições e resultados.

Como usar:
Text(
  'Texto de exemplo',
  style: TextStyle(fontSize: 18),
)
# 6. Image.network
Descrição: Exibe imagens da internet.

Aplicações: Usado para exibir imagens dos pratos no cardápio japonês.

Como usar:
Image.network('https://link-da-imagem.com')
# 7. ElevatedButton
Descrição: Botão elevado com destaque para ações principais.

Aplicações: Usado para ações como fazer pedidos no cardápio japonês.

Como usar:
ElevatedButton(
  onPressed: () {},
  child: Text('Clique aqui'),
)
# 8. ChoiceChip
Descrição: Chip de escolha que permite selecionar uma opção.

Aplicações: Usado para filtrar categorias de pratos no cardápio japonês.

Como usar:
ChoiceChip(
  label: Text('Sushi'),
  selected: true,
  onSelected: (bool selected) {},
)
# 9. Wrap
Descrição: Organiza widgets em múltiplas linhas ou colunas.

Aplicações: Usado para organizar categorias de pratos no cardápio japonês.

Como usar:
Wrap(
  spacing: 8.0,
  runSpacing: 4.0,
  children: [
    ChoiceChip(label: Text('Sushi')),
    ChoiceChip(label: Text('Ramen')),
  ],
)
# 10. Stack
Descrição: Sobrepõe widgets uns sobre os outros.

Aplicações: Usado para destacar selos ou descontos nos pratos.

Como usar:
Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(
      top: 10,
      right: 10,
      child: Container(
        color: Colors.green,
        child: Text('Desconto'),
      ),
    ),
  ],
)
# 11. Table
Descrição: Exibe dados em formato de tabela.

Aplicações: Usado para exibir tabela nutricional simplificada de um prato selecionado.

Como usar:
Table(
  children: [
    TableRow(
      children: [
        Text('Calorias'),
        Text('200'),
      ],
    ),
    TableRow(
      children: [
        Text('Proteínas'),
        Text('15g'),
      ],
    ),
  ],
)
# 12. Container
Descrição: Componente de caixa genérica que permite adicionar propriedades de layout.

Aplicações: Criação de cartões visuais, blocos de conteúdo e seções organizadas da interface.

Como usar:
Container(
  padding: EdgeInsets.all(16),
  color: Colors.grey[200],
  child: Text('Exemplo'),
)
# 13. Padding
Descrição: Adiciona espaçamento interno aos widgets.

Aplicações: Utilizado amplamente para dar espaçamento e organização visual aos componentes.

Como usar:
Padding(
  padding: EdgeInsets.all(16),
  child: Text('Texto'),
)
# 14. SizedBox
Descrição: Adiciona um espaço fixo entre widgets.

Aplicações: Usado para separação vertical e horizontal.

Como usar:
SizedBox(height: 20)
