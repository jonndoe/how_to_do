#!/bin/bash

echo "export -f conda"
echo "export -f __conda_activate"
echo "export -f __conda_reactivate"
echo "export -f __conda_hashr"
echo "export -f __add_sys_prefix_to_path"
echo 'eval "$(conda shell.bash hook)"'


NOW=$(date "+%Y-%m-%d")
mkdir $HOME/PycharmProjects/envs_backup/envs-$NOW
ENVS=$(conda env list | grep '^\w' | cut -d' ' -f1)
for env in $ENVS; do
    source ~/miniconda3/etc/profile.d/conda.sh
    conda activate $env
    echo $env
    mkdir $HOME/PycharmProjects/envs_backup/envs-$NOW/$env
    conda env export > $HOME/PycharmProjects/envs_backup/envs-$NOW/$env/$env.yml
    pip freeze > $HOME/PycharmProjects/envs_backup/envs-$NOW/$env/$env.txt
    echo "Exporting $env"
done
