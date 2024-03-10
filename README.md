# U-LALA

## INFOS
Unidade Lógica e Aritmetica (ULA) capaz de realizar 16 operações, possui duas entradas ('a' e 'b') de 5 bits cada, sendo o bit mais significativo o de sinal (utiliza a logica de complemento de dois para os numeros negativos). O controle da seleção das operações é feito pela entrada 'c', e sua saída é conectada diretamente a 3 displays de 7 segmentos (dois para os numeros em decimal e um para  sinal de negativo) e 3 leds: Um indicando se o numero é negativo; um indicando se o numero é zero; e um indicando se houve overflow; Alem disso sua saida também é conecta a 5 leds, indicando o numero em binário para auxiliar na verificação do resultado.
- Site do Figma: https://www.figma.com/file/uR4QfptXEkVPZeKUEMhpxg/U-LALA?type=design&node-id=0-1&mode=design&t=nFeaXqvR96Vx24ck-0

## OPERADORES
- [OR](or_gate.vhd): Realiza um XOR com todos os bits da entrada a com os bits da entrada b;
- [AND](and_gate.vhd): Realiza um AND com todos os bits da entrada a com os bits da entrada b;
- [NOR](nor_gate.vhd): Realiza um NOR com todos os bits da entrada a com os bits da entrada b;
- [NAND](nand_gate.vhd): Realiza um NAND com todos os bits da entrada a com os bits da entrada b;
- [XOR](xor_gate.vhd): Realiza um XOR com todos os bits da entrada a com os bits da entrada b;
- [XNOR](xnor_gate.vhd): Realiza um XNOR com todos os bits da entrada a com os bits da entrada b;
- [COMP 1](comp_de_um.vhd): Inverte os bits da entrada "a";
- [COMP 2](comp_de_dois.vhd): Inverte todos os bits, depois adiciona "00001";
- [SOMADOR](five_bits_sub_adder.vhd): Soma 'a' com 'b' (utiliza o mesmo arquivo que o subtrator);
- [SUBTRATOR](five_bits_sub_adder.vhd): Subtrai 'a' com 'b' (utiliza o mesmo arquivo que o somador);
- [SHIFT LEFT](shiftl.vhd): Move os bits de 'a' 1 posição para a esquerda (multiplica por dois);
- [SHIFT RIGHT](shiftr.vhd): Move os bits de 'a' 1 posição para a direita (divide por dois);
 

