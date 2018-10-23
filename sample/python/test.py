def hello(event, context):
  data = event['data']
  data['content'] = "Hello, " + data['content'] + "! Nice to meet you!"
  return data
