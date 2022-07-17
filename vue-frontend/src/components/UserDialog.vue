<template>
  <v-dialog v-model="isDialogOpen" max-width="500px">
    <v-card>
      <v-card-title>
        <span class="text-h5">{{
          newUser ? "New Customer" : "Update Customer"
        }}</span>
      </v-card-title>

      <validation-observer ref="observer" v-slot="{ invalid }">
        <form @submit.prevent="save">
          <v-card-text>
            <v-container>
              <v-col>
                <v-row>
                  <validation-provider
                    v-slot="{ errors }"
                    name="First name"
                    rules="required|alphaSpaces"
                    class="flex-grow-1"
                  >
                    <v-text-field
                      v-model="currentUser.first_name"
                      :error-messages="errors"
                      label="First Name"
                      required
                    ></v-text-field>
                  </validation-provider>
                </v-row>
                <v-row>
                  <validation-provider
                    v-slot="{ errors }"
                    name="Last name"
                    rules="required|alphaSpaces"
                    class="flex-grow-1"
                  >
                    <v-text-field
                      v-model="currentUser.last_name"
                      :error-messages="errors"
                      label="Last Name"
                      required
                    ></v-text-field>
                  </validation-provider>
                </v-row>
                <v-row>
                  <validation-provider
                    v-slot="{ errors }"
                    name="State"
                    rules="required|alphaSpaces"
                    class="flex-grow-1"
                  >
                    <v-text-field
                      v-model="currentUser.state"
                      :error-messages="errors"
                      label="State"
                      required
                    ></v-text-field>
                  </validation-provider>
                </v-row>
                <v-row>
                  <validation-provider
                    v-slot="{ errors }"
                    name="Country"
                    rules="required|alphaSpaces"
                    class="flex-grow-1"
                  >
                    <v-text-field
                      v-model="currentUser.country"
                      :error-messages="errors"
                      label="Country"
                      required
                    ></v-text-field>
                  </validation-provider>
                </v-row>
              </v-col>
            </v-container>
          </v-card-text>

          <v-card-actions>
            <v-spacer></v-spacer>
            <v-btn color="blue darken-1" text @click="close"> Cancel </v-btn>
            <v-btn color="blue darken-1" text type="submit" :disabled="invalid">
              Save
            </v-btn>
          </v-card-actions>
        </form>
      </validation-observer>
    </v-card>
  </v-dialog>
</template>

<script lang="ts">
import Vue from "vue";
import Component from "vue-class-component";
import { Prop, Watch } from "vue-property-decorator";
import {
  ValidationObserver,
  ValidationProvider,
  setInteractionMode,
  extend,
} from "vee-validate";
import {
  required,
  email,
  alpha_spaces as alphaSpaces,
  numeric,
  min,
} from "vee-validate/dist/rules";

import CustomerType from "../types/user";

extend("required", required);
extend("email", email);
extend("alphaSpaces", alphaSpaces);
extend("numeric", numeric);

setInteractionMode("eager");

@Component({
  components: {
    ValidationObserver,
    ValidationProvider,
  },
})
export default class UserDialog extends Vue {
  @Prop() value: boolean;

  @Prop() userData!: CustomerType;

  @Prop() onSubmit: (value: CustomerType) => void;

  @Prop() onUpdate: (value: CustomerType) => void;

  newUser = this.userData === null;

  currentUser = { ...this.userData } || {
    id: "",
    first_name: "",
    last_name: "",
    state: "",
    country: "",
  };

  @Watch("userData")
  onUserDataChanged(val: CustomerType, oldVal: CustomerType) {
    this.newUser = val === null;
    this.currentUser = { ...val } || {
      id: "",
      first_name: "",
      last_name: "",
      state: "",
      country: "",
    };
  }

  get isDialogOpen(): boolean {
    return this.value;
  }

  set isDialogOpen(value: boolean) {
    this.$emit("input", value);
  }

  close() {
    this.currentUser = {
      id: "",
      first_name: "",
      last_name: "",
      state: "",
      country: "",
    };
    this.isDialogOpen = false;
  }

  save() {
    if (this.newUser) this.$emit("submit", this.currentUser);
    else this.$emit("update", this.currentUser);
  }
}
</script>
