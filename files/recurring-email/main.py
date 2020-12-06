import smtplib

from string import Template

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

MY_ADDRESS = 'badbatbot@zohomail.com'
PR = 'j16D7$vf7J@z8&6Om#a8&%mxuzZphi' # Please have better things to do then take over this useless bot email. I literally can't be asked to hide this, so you shouldn't be bothered to login. There's nothing interesting inside.

def get_contacts():
    """
    Return two lists names, emails containing names and email addresses
    read from a file specified by filename.
    """
    names = ['']
    emails = ['sagirli.arif@gmail.com']
    return names, emails

def read_template(filename):
    """
    Returns a Template object comprising the contents of the 
    file specified by filename.
    """
    
    with open(filename, 'r', encoding='utf-8') as template_file:
        template_file_content = template_file.read()
        print(template_file_content)
    return Template(template_file_content)

def main():
    names, emails = get_contacts() 
    message_template = read_template('/home/thmyris/files/recurring-email/message.txt')

    # set up the SMTP server
    s = smtplib.SMTP(host='smtp.zoho.com', port=587)
    s.starttls()
    s.login(MY_ADDRESS, PR)

    # For each contact, send the email:
    for name, email in zip(names, emails):
        msg = MIMEMultipart()       # create a message

        # add in the actual person name to the message template
        message = message_template.substitute(PERSON_NAME=name.title())

        # Prints out the message body for our sake
        print(message)

        # setup the parameters of the message
        msg['From']=MY_ADDRESS
        msg['To']=email
        msg['Subject']="YOU WON'T BELIEVE WHAT THIS BAT EATS"
        
        # add in the message body
        msg.attach(MIMEText(message, 'plain'))
        
        # send the message via the server set up earlier.
        s.send_message(msg)
        del msg
        
    # Terminate the SMTP session and close the connection
    s.quit()
    
if __name__ == '__main__':
    main()
