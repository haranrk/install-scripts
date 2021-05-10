computers=(bmi balaji brats mirl)
for comp in "${computers[@]}"
do
    echo "$comp"
    ssh $comp "nvidia-smi"
done
