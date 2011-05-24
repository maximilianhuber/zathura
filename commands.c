/* See LICENSE file for license and copyright information */

#include "commands.h"
#include "zathura.h"
#include "print.h"

bool
cmd_bookmark_create(girara_session_t* session, girara_list_t* argument_list)
{
  return true;
}

bool
cmd_bookmark_delete(girara_session_t* session, girara_list_t* argument_list)
{
  return true;
}

bool
cmd_bookmark_open(girara_session_t* session, girara_list_t* argument_list)
{
  return true;
}

bool
cmd_close(girara_session_t* session, girara_list_t* argument_list)
{
  g_return_val_if_fail(session != NULL, false);
  g_return_val_if_fail(session->global.data != NULL, false);
  zathura_t* zathura = session->global.data;
  g_return_val_if_fail(zathura->document != NULL, false);

  document_close(zathura);

  return true;
}

bool
cmd_info(girara_session_t* session, girara_list_t* argument_list)
{
  return true;
}

bool
cmd_open(girara_session_t* session, girara_list_t* argument_list)
{
  return true;
}

bool
cmd_print(girara_session_t* session, girara_list_t* argument_list)
{
  g_return_val_if_fail(session != NULL, false);
  g_return_val_if_fail(session->global.data != NULL, false);
  zathura_t* zathura = session->global.data;

	if (zathura->document == NULL) {
		girara_error("no document as been opened");
		return false;
	}

	print((zathura_t*) session->global.data);;

  return true;
}

bool
cmd_save(girara_session_t* session, girara_list_t* argument_list)
{
  return true;
}
