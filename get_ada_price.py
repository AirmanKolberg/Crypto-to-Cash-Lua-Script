import cryptocompare
from os import system


def shell_command(user_in):

    _ = system(user_in)


def get_ada_price():

    crypto_price = cryptocompare.get_price(coin='ADA',
                                           currency='USD',
                                           full=True)['RAW']['ADA']['USD']['PRICE']

    return crypto_price


if __name__ == '__main__':

    ada_price = get_ada_price()

    shell_command("rm ADAvalue.txt")
    shell_command(f"echo '{str(ada_price)}' >> ADAvalue.txt")
