declare -a arr=("primary" "clear" "agriculture" "road" "water" "partly_cloudy" "cultivation" "habitation" "haze" "cloudy" "bare_ground" "selective_logging" "artisinal_mine" "blooming" "slash_burn" "blow_down" "conventional_mine")

for i in "${arr[@]}"
do
   echo "training the class of $i"
   python retrain.py \
		--bottleneck_dir=nets/$i/bottlenecks \
		--how_many_training_steps=1000 \
		--model_dir=nets/$i/inception \
		--summaries_dir=nets/$i/training_summaries/basic \
		--output_graph=nets/$i/retrained_graph.pb \
		--output_labels=nets/$i/retrained_labels.txt \
		--image_dir=photos/$i
    
done