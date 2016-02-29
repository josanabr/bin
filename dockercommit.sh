#!/bin/bash
#counter=1
#declare -a containers
docker ps --format "{{.ID}} {{.Image}}" | while read -r line; do
	#echo "[${counter}]: ${line}"
	echo "${line}"
	#containers[${counter}]=`echo $line | cut -d ' ' -f 1` 
	#counter=$((counter + 1))
done
echo -n "Seleccione uno de los contenedores: "
read opcion
choosen=`docker ps --format "{{.ID}} {{.Image}}" | grep ${opcion} | cut -d ' ' -f 2`
echo -n "Nombre sugerido para guardar el contenedor como imagen [${choosen}] "
read name
if [ "x${name}" == "x" ]; then
	name=${choosen}
fi
echo "Contenedor ${opcion} sera salvado como ${name}"
echo -n "Commit - "
docker commit ${opcion} ${name} 
if [ $? -eq 0 ]; then
	echo "OK"
else
	echo "Failed"
fi
	
#for id in "${!containers[@]}"; do
	#echo "${id} - ${containers["${id}"]}"
#done

