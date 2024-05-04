docker build -t perfectpick_wa .
docker run --network perfectpicknetwork -d -p 2024:2024 perfectpick_wa