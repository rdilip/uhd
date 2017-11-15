import subprocess
p = subprocess.Popen("./tfd", shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
out = p.communicate()[0]
print(out)
