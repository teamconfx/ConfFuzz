#!/bin/bash
project_dir=$1
result_dir=$(realpath $2)

touch $project_dir/log

recursive_identify () {
    if [[ -f pom.xml ]]; then
        if [[ -d src ]]; then
            module=$(realpath --relative-to ${project_dir} $PWD)
            echo $module
            JAVA_HOME=/home/tony/jdk-11.0.2 mvn confuzz:identify
            if [ $? -eq 0 ]; then
                mkdir -p $result_dir/$module
                cp confuzz_identify_param.csv $result_dir/$module
                cp confuzz_identify_ctest.csv $result_dir/$module
            else
                echo "$module failed!" >> $project_dir/log
            fi
        else
            subdircount=$(find . -maxdepth 1 -type d | wc -l)

            if ! [[ "$subdircount" -eq 1 ]]
            then
                for d in ./*/ ; do
                    cd $d
                    recursive_identify
                done
            fi
        fi
    fi
    cd ..
}
cd $project_dir
for d in ./*/ ; do
    echo $d
    cd $d
    recursive_identify
done

