docker-machine-set()
{
  local machine_name=$1
  docker-machine start $machine_name
  eval "$(docker-machine env $machine_name)"
  echo Docker machine ip is "$(docker-machine ip $machine_name)"
}
