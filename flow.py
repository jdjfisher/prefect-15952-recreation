from prefect import Flow

@Flow
async def hello_world():
  print("Hello, world!")