from twilio.rest import Client

# Amend these variables in order for this script to run...
sid = 'your'
token = 'info'
twilio_number = 'goes'
my_number = 'here'

client = Client(sid, token)


def twilio_call():
    
    client.calls.create(url='http://demo.twilio.com/docs/voice.xml',
                        to=my_number,
                        from_=twilio_number)


def twilio_text(text_message):

    client.messages.create(body=text_message,
                            from_=twilio_number,
                            to=my_number)


if __name__ == '__main__':

    twilio_call()
    twilio_text("Time to sell your ADA!")
