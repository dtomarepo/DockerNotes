from typing import Union

from fastapi import FastAPI

import debugpy 
debugpy.listen(("0.0.0.0", 5678))
# debugpy.wait_for_client() 

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World!!!!"}


@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}