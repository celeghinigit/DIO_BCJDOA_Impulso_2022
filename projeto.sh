#!/bin/bash

echo "Removendo estrutura anterior..."

for i in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
	userdel -r -f $i
done

for i in /publico /adm /ven /sec; do
	rm -Rf $i
done

for i in GRP_ADM GRP_VEN GRP_SEC; do
	groupdel $i
done


echo "Concluído!"
echo "Criando diretórios..."
mkdir /publico /adm /ven /sec

echo "Adicionando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Adicionando usuários..."
useradd carlos -m -s /bin/bash -G GRP_ADM -p $(openssl passwd 'Senha123')
useradd maria -m -s /bin/bash -G GRP_ADM -p $(openssl passwd 'Senha123')
useradd joao -m -s /bin/bash -G GRP_ADM -p $(openssl passwd 'Senha123')

useradd debora -m -s /bin/bash -G GRP_VEN -p $(openssl passwd 'Senha123')
useradd sebastiana -m -s /bin/bash -G GRP_VEN -p $(openssl passwd 'Senha123')
useradd roberto -m -s /bin/bash -G GRP_VEN -p $(openssl passwd 'Senha123')

useradd josefina -m -s /bin/bash -G GRP_SEC -p $(openssl passwd 'Senha123')
useradd amanda -m -s /bin/bash -G GRP_SEC -p $(openssl passwd 'Senha123') 
useradd rogerio -m -s /bin/bash -G GRP_SEC -p $(openssl passwd 'Senha123')

echo "Definindo permissões para diretórios..."
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 777 /publico
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Criação da estrutura concluída!"
