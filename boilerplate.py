import os
import pathlib
import subprocess
import threading

print("\033[36;1m---------------------THREADS--------------------------------\033[m")
print(f"threading.active_count: {threading.active_count()}")
print("\033[36;1m------------------------------------------------------------\033[m")

for dir in ['make','chore','infra','docker']:
    if not pathlib.Path.exists(dir):
        os.mkdir(dir)
    if dir == 'make':
      pathlib.Path.touch(f"{dir}/common.mk",exist_ok=True)
      pathlib.Path.touch(f"{dir}/cpp.mk",exist_ok=True)
    if dir == 'infra':
      subprocess.run(args=["mkdir" ,"-p","infra/envs/dev", "infra/modules/app_registration" ,"infra/modules/service_principal", "infra/modules/afic" ,"infra/modules/role_assignment"])
    if dir == 'docker':
      pathlib.Path.touch(f"{dir}/Dockerfile.dev", exist_ok=True)
      pathlib.Path.touch(f"{dir}/Dockerfile.staging", exist_ok=True)
    if dir == 'chore':
      for sub_dir in [ 'bash', 'cpp', 'c' ]:
        if not pathlib.Path(f"{dir}/{sub_dir}").exists():
          os.mkdir(path=f"{dir}/{sub_dir}")
