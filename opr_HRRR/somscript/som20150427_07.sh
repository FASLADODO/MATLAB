#!/usr/bin/expect -f
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0060min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0120min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0180min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0240min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0300min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0360min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0420min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
set timeout 120
spawn bash -c "scp hisnamey@boomer.oscer.ou.edu:/home/hisnamey/opr_img/20150427-07MergedReflectivityQCComposite_0480min.png /webhost/akahwang/http/png/"
expect {
-re ".*sword.*" {
exp_send "Minys0727\r"
    }
}
expect eof
cp /webhost/akahwang/http/src/opr20150427_07.html /webhost/akahwang/http/nowcast/Zindex.html