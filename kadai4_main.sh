#!/bin/bash 

#######################################
# shell name  : kadai4_main.sh
# Description : 最大公約数を求めるシェル
# Date        : 2021/08/06
#######################################

## 入力チェック
# 引数チェック
if [ $# -ne 2 ]; then
	echo "2つの自然数を入力してください"  
exit 1
fi

# 自然数チェック1 数字以外の場合、終了ステータスが2以上になる 
expr $1 + $2 > /dev/null 2>&1 
if [ $? -ge 2 ]; then
	echo "自然数を入力されていません" 
	exit 1
fi

# 自然数チェック2 引数にマイナスが存在しないかチェック
for num in $@
do
	if [ $num -lt 0 ]; then
		echo "マイナスが入力されています" 
		exit 1
	fi
done

# 自然数チェック3 引数に0が存在しないかチェック
for num in $@
do
	if [ $num -eq 0 ]; then
		echo "0が入力されています" 
		exit 1
	fi
done

# 入力値のセット
m=$1
n=$2

# 先頭のメッセージ出力 (テストスクリプト実行のためメッセージ出力させない）
#HEADER(){
#	echo "入力された "$m" と "$n" の"
#}

# ユークリッドの互除法を使った最大公約数の計算
# m=$1 n=$2  rを余りとする
# $mが大きい場合と小さい場合の2パターンを用意する。
if [ $m -gt $n ]; then       # $mが大きい場合
	#HEADER                   # ヘッダー出力
    r=`expr $m % $n`
    while [ $r != 0 ]
    do
        m=$n
        n=$r
        r=`expr $m \% $n`
    done
    #echo "最大公約数は "$n" です。" #テストスクリプト実行のためメッセージ出力させない
    echo $n
else                         # $nが大きい場合
	#HEADER                   # ヘッダー出力
    r=`expr $n \% $m`
    while [ $r != 0 ]
    do
        n=$m
        m=$r
        r=`expr $n \% $m`
    done
    #echo "最大公約数は "$m" です。" #テストスクリプト実行のためメッセージ出力させない
    echo $m
fi

