docker build -t perfectpick_wa .
docker run --name perfectpick_wa --network perfectpicknetwork -d -p 2024:80 perfectpick_wa 