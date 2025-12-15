# set api key
# or set api key in `scripts/env/set_env.sh`
# . scripts/env/set_env.sh
export OPENAI_API_KEY=""
export OPENAI_API_BASE="https://api.openai.com/v1"

export PYTHONPATH=$PYTHONPATH:$(pwd)
export GRAPH_INDEX_DIR='{INDEX_DIR}/{DATASET_NAME}/graph_index_v2.3'
export BM25_INDEX_DIR='{INDEX_DIR}/{DATASET_NAME}/BM25_index'

result_path='/home/xuxiufeng/Projects/LocAgent/outputs'
echo $result_path
mkdir -p $result_path

python auto_search_main.py \
    --dataset 'czlll/SWE-bench_Lite' \
    --split 'test' \
    --model 'apac.anthropic.claude-3-5-sonnet-20241022-v2:0' \
    --localize \
    --merge \
    --output_folder $result_path/location \
    --eval_n_limit 1 \
    --num_processes 50 \
    --use_function_calling \
    --simple_desc